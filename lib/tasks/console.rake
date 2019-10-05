# frozen_string_literal: true

desc 'Launch app console'
task 'console' do
  Rake.application['app:require_everything'].invoke

  # This is the app console
  binding.pry
end
