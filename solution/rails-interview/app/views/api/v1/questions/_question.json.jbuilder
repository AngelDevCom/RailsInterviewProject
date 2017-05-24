json.extract! question, :id, :title

json.answers question.answers do |answer| 
  json.id answer.id
  json.body answer.body
  json.user_id answer.user.id
  json.user_name answer.user.name
end