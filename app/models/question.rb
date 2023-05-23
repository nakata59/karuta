class Question < ApplicationRecord
    after_create_commit -> { broadcast_append_to 'questions', partial: 'bus_lines/list_question' }
    after_update_commit -> { broadcast_update_to 'questions', partial: 'bus_lines/list_question' }
    after_destroy_commit -> { broadcast_remove_to 'questions' }
end
