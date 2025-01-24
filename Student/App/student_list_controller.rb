require_relative '../student_list/student_list_base'
require_relative '../student_list/student_list_json'
# require_relative '../student_list/student_list_db'
require_relative '../date/data_list_student_short'
require_relative 'student_list_view'

class Student_list_controller
  def initialize(view, config: nil)
    @view = view
    @json_strategy = Students_list_JSON.new
    @student_list = Student_list_base.new('C:\\Users\\lartu\\Ruby\\Student\\students.json', @json_strategy)
    @student_list.read_to_file
    @data_list = Data_list_student_short.new([])
    @data_list.add_observer(@view)
  end

  def refresh_data
    @student_list.get_k_n_student_short_list(k: @view.current_page + 1, n: @view.items_per_page, data_list: @data_list)
    total_count = get_count
    update_pagination(total_count)
    @data_list.count = total_count
    @data_list.notify
    @student_list.read_to_file

  end

  def get_count
    @student_list.get_student_short_count
  end

  def sort_column
    @student_list.sort_by_initials
  end

  def update_pagination(total_count)
    @view.total_pages = (total_count / @view.items_per_page.to_f).ceil

    if @view.current_page >= @view.total_pages
      @view.current_page = [@view.total_pages - 1, 0].max
    end
  end



end

