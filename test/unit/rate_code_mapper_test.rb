require 'test_helper'

class RateCodeMapper
  # SUPPORTED_CARRIERS = {
  #     'shipwire' => ['ups', 'usps', 'fedex'],
  #     'amazon' => [''],
  #     'webgistix' => []
  #   }
  
  MAPPING = {
    :webgistix => {
      :usps => {
        
      }
      
    }
    
  }
  SHIPWIRE_CODES = {
    '1D' => [],
    '2D' => [],
    'GD' => [],
    'FT' => [],
    'INTL' => []
  }
  
  SHIPWIRE_CODES.each do |code, list|
    
  end
  
  
  def initialize(from, to)
    @carrier_service = from
    @fulfillment_service = to
  end
  
  def fulfillment_code_for(carrier_rate_code)
    'Ground'
  end
end

class RateCodeMapperTest < Test::Unit::TestCase
  
  def test_fulfillment_code_for_webgistix_rate_from_ups
    mapper = RateCodeMapper.new('ups', 'webgistix')
    assert_equal 'Ground', mapper.fulfillment_code_for('03')
  end
  
  def test_invalid_carrier_service_raises_argument_error
    assert_raises(ArgumentError) do
      RateCodeMapper.new('unknown', 'webgistix')
    end
  end
  
  def test_invalid_fulfillment_service_raises_argument_error
    assert_raises(ArgumentError) do
      RateCodeMapper.new('ups', 'unknwown')
    end
  end
  
end