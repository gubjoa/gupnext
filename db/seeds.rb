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
