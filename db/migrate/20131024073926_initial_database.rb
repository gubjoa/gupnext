class InitialDatabase < ActiveRecord::Migration
  def change
	create_table :languages do |t|
	  t.string :sv_name
	  t.string :en_name
	  t.string :iso
	  t.integer :priority
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :publication_types do |t|
	  t.string :sv_name
	  t.string :en_name
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :publications do |t|
	  t.integer :pubid
	  t.string :name
	  t.belongs_to :publication_type
	  t.belongs_to :language
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :publication_data do |t|
	  t.string :key
	  t.string :value
	  t.belongs_to :publication
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :publication_meta_data do |t|
	  t.string :key
	  t.string :value
	  t.belongs_to :publication
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :people do |t|
	  t.string :firstname
	  t.string :lastname
	  t.string :username
	  t.integer :birthyear
	  t.datetime :publist_verify_date
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :departments do |t|
	  t.string :sv_name
	  t.string :en_name
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end
	create_table :addresses do |t|
	  t.belongs_to :publication
	  t.belongs_to :department
	  t.belongs_to :person
	  t.string :created_by
	  t.string :updated_by
	  t.string :deleted_by
	  t.timestamps
	  t.datetime :deleted_at
	end


  end
end
