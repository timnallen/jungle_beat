require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head
      find_last_node.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
    data
  end

  def prepend(data)
    if @head
      node = @head
      @head = Node.new(data, node)
    else
      @head = Node.new(data)
    end
  end

  def insert(position, data)
    node_before = find_previous_node_in_position(position)
    node_after = node_before.next_node
    node_before.next_node = Node.new(data, node_after)
    data
  end

  def count
    count = 0
    if @head
      node = @head
      count += 1
      while node.next_node
        node = node.next_node
        count += 1
      end
    end
    return count
  end

  def to_string
    all_data.join(' ') if all_data
  end

  def find_last_node
    find_previous_node_in_position(count)
  end

  def find(position, number_of_elements)
    node = find_current_node_in_position(position)
    all_data = [node.data]
    count = 1
    while count != number_of_elements
      node = node.next_node
      all_data << node.data
      count += 1
    end
    return all_data.join(' ')
  end

  def includes?(element)
    counter = 0
    node = @head
    return true if @head.data == element
    while counter != (count - 1)
      node = node.next_node
      return true if node.data == element
      counter += 1
    end
    false
  end

  def pop
    node = find_previous_node_in_position(count - 1)
    value_deleted = node.next_node.data
    node.next_node = nil
    return value_deleted
  end

  def find_previous_node_in_position(position)
    find_current_node_in_position(position - 1)
  end

  def find_current_node_in_position(position)
    current_position = 0
    node = @head
    while current_position != position
      node = node.next_node
      current_position += 1
    end
    return node
  end

  def all_data
    if @head
      all_data = []
      node = @head
      all_data << node.data
      while node.next_node
        node = node.next_node
        all_data << node.data
      end
      all_data
    end
  end
end
