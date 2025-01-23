require 'fox16'
require_relative 'student_list_view'
require_relative 'student_list_controller'
require_relative '../student_list/student_list_db'

include Fox

app = FXApp.new
view = Student_list_view.new(app)
app.create
app.run






















