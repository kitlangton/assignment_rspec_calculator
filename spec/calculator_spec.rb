require 'calculator'

describe Calculator do

  let(:calculator) { Calculator.new }

  describe '#add' do

    it 'should add two integers' do
      expect(calculator.add(2,4)).to eq 6
    end

    it 'should adds two negative integers' do
      expect(calculator.add(-2,-4)).to eq -6
    end

    it 'should adds two floats' do
      expect(calculator.add(2.5,4.5)).to eq 7
    end
  end

  describe '#subtract' do
    it 'substracts two integers' do
      expect(calculator.subtract(2,4)).to eq -2
    end

    it 'substracts two negative integers' do
      expect(calculator.subtract(-2,-4)).to eq 2
    end

    it 'substracts two floats' do
      expect(calculator.subtract(2.5,4.5)).to eq -2
    end
  end

  describe '#multiply' do
    it 'multiplies two integers' do
      expect(calculator.multiply(2,4)).to eq 8
    end

    it 'multiplies negatives and positives' do
      expect(calculator.multiply(-2,4)).to eq -8
    end
  end

  describe '#divide' do
    it 'raises an error when dividing by zero' do
      expect{ calculator.divide(2,0) }.to raise_error ArgumentError
    end

    it 'returns an integer if there is no remainder' do
      expect(calculator.divide(8,2)).to be_an Integer
    end

    it 'returns a float if there is a remainder' do
      expect(calculator.divide(8,3)).to be_a Float
    end
  end

  describe '#pow' do
    it 'properly raises a number to its power' do
      expect(calculator.pow(2,3)).to eq 8
    end

    it 'properly raises a negative number to its power' do
      expect(calculator.pow(-2,3)).to eq -8
    end

    it 'properly raises a decimal to its power' do
      expect(calculator.pow(2.5,3)).to eq 15.625
    end
  end

  describe '#sqrt' do
    it 'properly determines square roots for positive numbers' do
      expect(calculator.sqrt(16)).to eq 4
    end

    it 'returns integers for round roots' do
      expect(calculator.sqrt(64)).to be_an Integer
    end

    it 'returns two digit decimals for non-round roots' do
      expect(calculator.sqrt(60)).to be_a Float
    end
  end

  describe '#memory=' do
    it 'stores an object in memory' do
      calculator.memory = 3
      memory = calculator.instance_variable_get(:@memory)
      expect(memory).to eq 3
    end

    it 'overwrites any previes object in memory' do
      calculator.instance_variable_set(:@memory, 8)
      calculator.memory = 3
      memory = calculator.instance_variable_get(:@memory)
      expect(memory).to eq 3
    end
  end

  describe '#memory' do
    it 'returns the object in memory' do
      calculator.memory = 3
      expect(calculator.memory).to eq 3
    end

    it 'starts as nil' do
      expect(calculator.memory).to eq nil
    end

    it 'clears memory when returned' do
      calculator.memory = 3
      calculator.memory
      expect(calculator.memory).to eq nil
    end
  end

  context 'calculator is initialized with stringify' do
    let(:stringify_calculator) { Calculator.new(true) }

    it 'outputs stringified integers' do
      expect(stringify_calculator.add(3,5)).to eq '8'
    end
  end
end
