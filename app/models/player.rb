class Player < ApplicationRecord  
  after_create_commit -> { broadcast_append_to 'players', partial: 'bus_lines/list_player' }
  after_update_commit -> { broadcast_update_to 'players', partial: 'bus_lines/list_player' }
  after_destroy_commit -> { broadcast_remove_to 'players' }

  enum situation: [:待機, :正常,:お手つき ]
end
