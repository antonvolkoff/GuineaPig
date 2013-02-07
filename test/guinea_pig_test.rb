require_relative "test_helper"

class GuineaPigTest < MiniTest::Unit::TestCase
  def setup
    GuineaPig::ABTest.destroy_all
    User.destroy_all

    GuineaPig::Experiments.stubs(:experiments_path).returns("#{FIXTURES}/ab_experiments.yml")
    @user = User.create!
  end

  def test_get
    alternative = GuineaPig.get(:experiment_monkey, @user)

    ab_test = GuineaPig::ABTest.last
    assert_equal(alternative, ab_test.alternative)
    assert_equal("experiment_monkey", ab_test.experiment)
    assert_includes(["alternative_monkey_1", "alternative_monkey_2"], ab_test.alternative)
    assert_equal(@user, ab_test.guinea_pig)
    assert_equal(1, ab_test.seen_count)
    assert_equal(0, ab_test.conversion_count)
  end

  def test_get_multiple_times_for_the_same_guinea_pig_should_return_the_same_alternative
    first_alternative =
      assert_difference "GuineaPig::ABTest.count", 1 do
        GuineaPig.get(:experiment_monkey, @user)
      end

    second_alternative =
      assert_difference "GuineaPig::ABTest.count", 0 do
        GuineaPig.get(:experiment_monkey, @user)
      end

    assert_equal(first_alternative, second_alternative)
  end

  def test_update_seen_counter_any_time_test_is_loaded
    GuineaPig.get(:experiment_monkey, @user)
    assert_equal(1, GuineaPig::ABTest.last.seen_count)

    GuineaPig.get(:experiment_monkey, @user)
    assert_equal(2, GuineaPig::ABTest.last.seen_count)
  end

  def test_conversion
    ab_test = GuineaPig::ABTest.create!(:experiment => :experiment_monkey, :guinea_pig => @user)

    assert_equal(0, ab_test.conversion_count)

    ab_test.conversion!
    assert_equal(1, ab_test.conversion_count)

    ab_test.conversion!
    assert_equal(2, ab_test.conversion_count)
  end
end