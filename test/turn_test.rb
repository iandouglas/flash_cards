require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test
  def setup
    @guess = "Juneau"
    @card = Card.new("What is the capital of Alaska?", @guess, :Geography)

    @turn = Turn.new(@guess, @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_attributes
    assert_equal @guess, @turn.guess

    assert_instance_of Card, @turn.card
    assert_equal @card, @turn.card
  end

  def test_correct_answer_is_correct?
    assert @turn.correct?
  end

  def test_feedback_for_correct_answer
    assert_equal "Correct", @turn.feedback
  end

  def test_incorrect_answer_is_not_correct?
    turn_2 = Turn.new("Saturn", @card)
    refute turn_2.correct?
  end

  def test_feedback_for_incorrect_answer
    turn_2 = Turn.new("Saturn", @card)

    assert_equal "Incorrect", turn_2.feedback
  end
end
