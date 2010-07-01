class AddAuthenticationToClinician < ActiveRecord::Migration
  def self.up
    add_column :clinicians, :email, :string,               :null => false, :default => '' # optional, you can use login instead, or both
    add_column :clinicians, :crypted_password, :string,    :null => false, :default => '' # optional, see below
    add_column :clinicians, :password_salt, :string,       :null => false, :default => '' # optional, but highly recommended
    add_column :clinicians, :persistence_token, :string,   :null => false, :default => '' # required
    add_column :clinicians, :single_access_token, :string, :null => false, :default => '' # optional, see Authlogic::Session::Params
    add_column :clinicians, :perishable_token, :string,    :null => false, :default => '' # optional, see Authlogic::Session::Perishability

    # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
    add_column :clinicians, :login_count, :integer,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :failed_login_count, :integer,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :last_request_at, :datetime                                   # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :current_login_at, :datetime                                  # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :last_login_at, :datetime                                     # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :current_login_ip, :string                                    # optional, see Authlogic::Session::MagicColumns
    add_column :clinicians, :last_login_ip, :string                                       # optional, see Authlogic::Session::MagicColumns
  end

  def self.down
    remove_column :clinicians, :email
    remove_column :clinicians, :crypted_password
    remove_column :clinicians, :password_salt
    remove_column :clinicians, :persistence_token
    remove_column :clinicians, :single_access_token
    remove_column :clinicians, :perishable_token
    remove_column :clinicians, :login_count
    remove_column :clinicians, :failed_login_count
    remove_column :clinicians, :last_request_at
    remove_column :clinicians, :current_login_at
    remove_column :clinicians, :last_login_at
    remove_column :clinicians, :current_login_ip
    remove_column :clinicians, :last_login_ip
  end
end
