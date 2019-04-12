require './lib/linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data.split.each do |element|
      @list.append(element)
    end
    return data
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 #{beats}`
  end
end
