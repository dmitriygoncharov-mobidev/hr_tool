Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :name,  String, null: false
      column :google_id, String, null: false
      column :email, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
