require_relative 'poker_system'

require 'pstore'
require 'colorize'

def select_action
    menu_action = nil

    while menu_action != '1' && menu_action != '2'
        system "clear"

        print 'Welcome to Poker Ruby'.colorize(:red)
        puts ' Select one'
        puts '1 - New Game'
        puts '2 - Load Game'

        menu_action = gets.chomp
    end

    return menu_action
end

def new_game?(menu_action)
    menu_action.eql?('1')
end

def load_game?(menu_action)
    menu_action.eql?('2')
end

menu_action = select_action

poker_system = PokerSystem.new
poker_system.load_cards

save = PStore.new('save.pstore')

save.transaction do
    save['save'] = poker_system
    save[:save_index] ||= []
    save[:save_index].push(poker_system)
    save[:save_index].push(poker_system.cards)
end