# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

languages = Language.create([
	{sv_name: 'svenska', en_name: 'Swedish', iso: 'swe', priority: 1, created_by: 'xanjoo'},
	{sv_name: 'engelska', en_name: 'English', iso: 'eng', priority: 1, created_by: 'xlpero', created_at: '1999-12-31'},
	{sv_name: 'tyska', en_name: 'German', iso: 'ger', priority: 2, created_by: 'xlpero', created_at: '1999-12-31'}
])

publication_types = PublicationType.create([
	{sv_name: 'artikel', en_name: 'article', created_by: 'xanjoo'},
	{sv_name: 'bokkapitel', en_name: 'book chapter', created_by: 'xljoha'},
	{sv_name: 'konferensbidrag', en_name: 'conference proceeding', created_by: 'xmagnn'}
])

people = Person.create([
	{firstname: 'Johan', lastname: 'Andersson von Gejier', username: 'xanjoo', birthyear: 1970},
	{firstname: 'Per', lastname: 'Larsson', username: 'xlpero', birthyear: 1975},
	{firstname: 'Niclas', lastname: 'Magnusson', username: 'xmagnn', birthyear: 1971}
])

departments = Department.create([
	{sv_name: 'Göteborgs universitetsbibliotek', en_name: 'Gothenburg University Library'},
	{sv_name: 'N.Y.B.S', en_name: 'N.Y.F.D'}
])

publications = Publication.create([
	{pubid: 20, name: 'Test title', publication_type_id: publication_types.first, language_id: languages.first}
])

addresses = Address.create([
	{publication_id: publications.first, person_id: people.first, department_id: departments.first},
	{publication_id: publications.first, person_id: people.first, department_id: departments.last},
	{publication_id: publications.first, person_id: people.last, department_id: departments.last}
])
