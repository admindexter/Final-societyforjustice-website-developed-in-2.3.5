class AddAccountInfo < ActiveRecord::Migration
  def self.up
    Account.delete_all

    DormAccount.delete_all

    Account.create(
    :name => 'International Society for Social Justice and Human Rights (ISSJHR)',
    :ac_number => '0617067726518',
    :location => 'Equitorial Trust Bank (ETB), Port Harcourt, Rivers State Nigeria')

    DormAccount.create(
    :name => 'International Society for Social Justice and Human Rights (ISSJHR)',
    :ac_number => '0617067726518',
    :location => 'Equitorial Trust Bank (ETB), Port Harcourt, Rivers State Nigeria')
  end

  def self.down
    Account.delete_all

    DormAccount.delete_all
  end
end

