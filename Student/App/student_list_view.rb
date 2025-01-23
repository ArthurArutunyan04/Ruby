require 'fox16'
require_relative 'student_list_controller'
require_relative '../student_list/student_list_db'


include Fox

class Student_list_view < FXMainWindow
  attr_reader :current_page, :items_per_page

  def initialize(app, config: nil)
    super(app, "Student list", width: 905, height: 475)
    @controller = Student_list_controller.new(self, config: config)
    @filters = {}
    @current_page = 0
    @items_per_page = 20
    @total_pages = (@controller.get_count / @items_per_page).ceil + 1

    main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    filter_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 200)
    setup_filtration(filter_frame)

    table_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    setup_table(table_frame)

    button_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 150)
    setup_buttons(button_frame)

    @controller.refresh_data
  end

  def setup_filtration(filter)
    FXLabel.new(filter, "Фильтрация")
    FXLabel.new(filter, "Фамилия и инициалы:")
    @name_input = FXTextField.new(filter, 15, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)

    add_filter(filter, "Git")
    add_filter(filter, "Почта")
    add_filter(filter, "Телефон")
    add_filter(filter, "Telegram")

    reset_button = FXButton.new(filter, "Сбросить", opts: BUTTON_NORMAL)
    reset_button.connect(SEL_COMMAND) do
      reset_filters
    end
  end

  def add_filter(parent, label_text)
    section_frame = FXVerticalFrame.new(parent, LAYOUT_FILL_X | LAYOUT_FIX_HEIGHT, height: 80)
    FXLabel.new(section_frame, label_text)

    combo_box = FXComboBox.new(section_frame, 3, nil, 0, COMBOBOX_STATIC | LAYOUT_FILL_X)
    combo_box.numVisible = 3
    combo_box.appendItem("Да")
    combo_box.appendItem("Нет")
    combo_box.appendItem("Не важно")
    combo_box.setCurrentItem(2)

    input_field = FXTextField.new(section_frame, 15, opts: TEXTFIELD_NORMAL | LAYOUT_FILL_X)
    input_field.hide

    @filters[label_text] = { combo_box: combo_box, input_field: input_field }

    combo_box.connect(SEL_COMMAND) do
      case combo_box.currentItem
      when 0
        input_field.show
      else
        input_field.hide
      end
      section_frame.recalc
    end
  end

  def reset_filters
    @name_input.text = ""
    @filters.each do |label, filter|
      filter[:input_field].text = "" if filter[:input_field].visible?
    end
  end

  def setup_table(parent_frame)
    @table = FXTable.new(parent_frame, opts: TABLE_READONLY | LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @table.rowHeader.width = 0
    @table.setTableSize(20, 4)
    @table.setColumnWidth(0, 30)
    @table.setColumnWidth(1, 80)
    @table.setColumnWidth(2, 200)
    @table.setColumnWidth(3, 200)


    @table.columnHeader.connect(SEL_COMMAND) do |sender, sel, event|
      if event.to_i == 1
        @controller.sort_column
        @controller.refresh_data
      end
    end

    @table.connect(SEL_COMMAND) do |sender, sel, event|
      check_count_selected_rows
    end

    navigation_segment = FXHorizontalFrame.new(parent_frame, opts: LAYOUT_CENTER_X | LAYOUT_FIX_WIDTH, width: 100)
    @prev_button = FXButton.new(navigation_segment, "🡸", opts: LAYOUT_LEFT | BUTTON_NORMAL)
    @page_index = FXLabel.new(navigation_segment, "#{@current_page + 1}", opts: LAYOUT_CENTER_X)
    @next_button = FXButton.new(navigation_segment, "🡺", opts: LAYOUT_RIGHT | BUTTON_NORMAL)

    @prev_button.connect(SEL_COMMAND) do
      change_page(-1)

    end
    @next_button.connect(SEL_COMMAND) do
      change_page(1)

    end
  end

  def check_count_selected_rows
    selected_rows_number = @table.selEndRow - @table.selStartRow + 1
    if selected_rows_number == 1
      @edit_button.enabled = true
    else
      @edit_button.enabled = false
    end

    if selected_rows_number >= 1
      @delete_button.enabled = true
    else
      @delete_button.enabled = false
    end
  end

  def change_page(offset)
    new_page = @current_page + offset
    return if new_page < 0 || new_page >= @total_pages
    @current_page = new_page
    @controller.refresh_data
  end

  def setup_buttons(button_frame)
    FXLabel.new(button_frame, "Управление")
    FXButton.new(button_frame, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_button = FXButton.new(button_frame, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_button.enabled = false
    @delete_button = FXButton.new(button_frame, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @delete_button.enabled = false
    @update_button = FXButton.new(button_frame, "Обновить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def set_table_params(column_names, whole_entities_count)
    display_names = {
      'surname_with_initials' => 'Фамилия и инициалы',
      'contact' => 'Контакт',
      'git' => 'Git'
    }
    @table.setColumnText(0, "№")
    column_names.each_with_index do |name, id|
      display_name = display_names[name] || name
      @table.setColumnText(id + 1, display_name)
    end
    @table.setColumnWidth(0, 30)
    @table.setColumnWidth(1, 150)
    @table.setColumnWidth(2, 150)
    @table.setColumnWidth(3, 200)
  end

  def set_table_data(data)
    @table_data = data
    update_table_data
  end

  def update_table_data
    (0...@items_per_page).each do |row|
      item = @table_data.data[row]
      if item
        @table.setItemText(row, 0, (row + 1 + (@current_page * @items_per_page)).to_s)
        @table.setItemText(row, 1, item[1].to_s)
        @table.setItemText(row, 2, item[2].to_s)
        @table.setItemText(row, 3, item[3].to_s)
      else
        @table.setItemText(row, 0, "")
        @table.setItemText(row, 1, "")
        @table.setItemText(row, 2, "")
        @table.setItemText(row, 3, "")
      end
    end
    @page_index.setText("#{@current_page + 1} / #{@total_pages}")
  end

  private :setup_filtration, :add_filter, :reset_filters, :setup_buttons, :change_page, :update_table_data, :check_count_selected_rows, :setup_table




end

