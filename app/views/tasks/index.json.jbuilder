json.array! @tasks, partial: "tasks/task", as: :task

json.array! @tasks do |task|
  json.extract! task, :id, :description   
  json.title task.name
  json.start task.start_date   
  json.end task.end_date   
  json.url task_url(task, format: :html) 
end