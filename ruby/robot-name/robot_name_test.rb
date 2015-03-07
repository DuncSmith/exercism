require 'minitest/autorun'
require_relative 'robot'

class RobotTest < MiniTest::Unit::TestCase
  def setup
    # # reset 'static' variables before each test
    # Robot.instance_eval('@names = nil')
    # Robot.instance_eval('@released_names = nil')
  end

  def test_has_name
    # rubocop:disable Lint/AmbiguousRegexpLiteral
    assert_match /^[A-Z]{2}\d{3}$/, Robot.new.name
    # rubocop:enable Lint/AmbiguousRegexpLiteral
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    # rubocop:disable Lint/UselessComparison
    assert Robot.new.name != Robot.new.name
    # rubocop:enable Lint/UselessComparison
  end

  def test_reset_name
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
    # rubocop:disable Lint/AmbiguousRegexpLiteral
    assert_match /^[A-Z]{2}\d{3}$/, name2
    # rubocop:enable Lint/AmbiguousRegexpLiteral
  end
  
  # def test_reuse_released_names_in_order_released
    # lots_of_robots = (1..675998).map {Robot.new}
    # a_released_name = lots_of_robots[100000].name
    # another_released_name = lots_of_robots[300000].name
    # lots_of_robots[100000].reset
    # lots_of_robots[300000].reset
    # assert lots_of_robots[100000] != a_released_name
    # assert lots_of_robots[300000] != another_released_name
    # assert_equal Robot.new.name, a_released_name
    # assert_equal Robot.new.name, another_released_name
  # end
  
  # def test_robot_does_not_get_new_name_on_reset_when_all_robots_exist
    # all_robots = (1..676000).map {Robot.new}
    # old_name = all_robots[100000].name
    # all_robots[100000].reset
    # assert_equal old_name, all_robots[100000].name
  # end
end
