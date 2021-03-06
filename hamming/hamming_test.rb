gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'hamming'

class HammingTest < MiniTest::Test
  def test_no_difference_between_empty_strands
    assert_equal 0, Hamming.compute('', '')
  end

  def test_no_difference_between_identical_strands
    assert_equal 0, Hamming.compute('GGACTGA','GGACTGA')
  end

  def test_complete_hamming_distance_in_small_strand
    assert_equal 3, Hamming.compute('ACT', 'GGA')
  end

  def test_hamming_distance_in_off_by_one_strand
    assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  end

  def test_small_hamming_distance_in_middle_somewhere
    assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
  end

  def test_larger_distance
    assert_equal 2, Hamming.compute('ACCAGGG', 'ACTATGG')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
    assert_equal 3, Hamming.compute('AAACTAGGGG', 'AGGCTAGCGGTAGGAC')
  end

  def test_ignores_extra_length_on_original_strand_when_longer
    assert_equal 5, Hamming.compute('GACTACGGACAGGGTAGGGAAT', 'GACATCGCACACC')
  end
end
