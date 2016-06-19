class AddAutorToTickets < ActiveRecord::Migration
  def change
    #change
    #add_reference :tickets, :autor, index: true, foreign_key: true
    #to
    add_reference :tickets, :autor, index: true
    #autor apuntando a tabla users, nombre de columna autor_id (y no user_id)
    add_foreign_key :tickets,:users, column: :autor_id
  end
end
