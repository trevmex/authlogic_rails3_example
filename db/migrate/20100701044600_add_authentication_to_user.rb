class AddAuthenticationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string,               :null => false, :default => '' # optional, you can use login instead, or both
    add_column :users, :crypted_password, :string,    :null => false, :default => '' # optional, see below
    add_column :users, :password_salt, :string,       :null => false, :default => '' # optional, but highly recommended
    add_column :users, :persistence_token, :string,   :null => false, :default => '' # required
    add_column :users, :single_access_token, :string, :null => false, :default => '' # optional, see Authlogic::Session::Params
    add_column :users, :perishable_token, :string,    :null => false, :default => '' # optional, see Authlogic::Session::Perishability

    # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
    add_column :users, :login_count, :integer,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :users, :failed_login_count, :integer,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_request_at, :datetime                                   # optional, see Authlogic::Session::MagicColumns
    add_column :users, :current_login_at, :datetime                                  # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_login_at, :datetime                                     # optional, see Authlogic::Session::MagicColumns
    add_column :users, :current_login_ip, :string                                    # optional, see Authlogic::Session::MagicColumns
    add_column :users, :last_login_ip, :string                                       # optional, see Authlogic::Session::MagicColumns
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :crypted_password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :perishable_token
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_request_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip
  end
end
