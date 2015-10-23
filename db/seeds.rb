# rake db:drop && rake db:create && rake db:migrate && rake db:seed

User.create(first_name:"Sharon", last_name:"Ji", email:"sharon.bowei.ji@gmail.com", age:25, password:"password", gender:"female")

# u = User.create(first_name:"Sharon", last_name:"Ji", email:"sharon.bowei.ji@gmail.com", age:25, password:"password", gender:"female")
# ds = u.decisions.create([{name: "Where should I go for vacation?", user_id:1},{name: "What should I do after class ends", user_id:1},{name: "Dating in San Francisco", user_id:1}])

# m = Metric.create({})
# ds.factors.first << m
# ds.options.first << m

Decision.create([{name: "Where should I go for vacation?", user_id:1},{name: "What should I do after class ends", user_id:1},{name: "Dating in San Francisco", user_id:1}])

Factor.create([{name: "price", decision_id:1, max_score:10}, {name: "time", decision_id:1, max_score:5}, {name: "location", decision_id:1, max_score:2}])

Option.create([{name: "Florence, Italy", decision_id:1}, {name: "Beijing, China", decision_id:1}, {name: "Costa Rica", decision_id:1}, {name: "Israel", decision_id:1}])

Metric.create([{factor_id:1, option_id:1, score:3}, {factor_id:1, option_id:2, score:2}, {factor_id:1, option_id:3, score:3}])

Metric.create([{factor_id:2, option_id:1, score:4}, {factor_id:2, option_id:2, score:3}, {factor_id:2, option_id:3, score:2}])

Metric.create([{factor_id:3, option_id:1, score:2}, {factor_id:3, option_id:2, score:2}, {factor_id:3, option_id:3, score:1}])