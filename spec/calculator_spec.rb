RSpec.describe Calculator do
  let(:calc) { Calculator.new }

  describe '#add' do
    it 'adds two numbers' do
      expect(calc.add(3, 5)).to eq 8
      expect(calc.add(3, -5)).to eq -2
      expect(calc.add(3.0, 5.5)).to eq 8.5
    end
  end

  describe '#subtract' do
    it 'subtracts two numbers' do
      expect(calc.subtract(2, 1)).to eq 1
      expect(calc.subtract(2.0, 1.0)).to eq 1
      expect(calc.subtract(1, 2.5)).to eq -1.5
      expect(calc.subtract(1, -2)).to eq 3
    end
  end

  describe '#multiply' do
    it 'multiplies two numbers' do
      expect(calc.multiply(2, 1)).to eq 2
      expect(calc.multiply(2.5, 3)).to eq 7.5
      expect(calc.multiply(7, 6)).to eq 42
      expect(calc.multiply(7, -6)).to eq -42
    end
  end

  describe '#divide' do
    it 'divides two numbers' do
      expect(calc.divide(42, 7)).to eq 6
      expect(calc.divide(12.0, 3)).to eq 4
      expect(calc.divide(12, 7)).to be_within(0.001).of(1.7142)
    end
    context 'divide by zero' do
      it 'raises an error' do
        expect { calc.divide(1, 0) }.to raise_error ArgumentError
        expect { calc.divide(1, 0.000) }.to raise_error ArgumentError
      end
    end
  end

  describe '#pow' do
    it 'raises first number to the power of the second' do
      expect(calc.pow(2, 3)).to eq 8
      expect(calc.pow(2, 1.233)).to be_within(0.0001).of(2.3505)
      expect(calc.pow(2, -1)).to eq 0.5
    end
  end

  describe 'sqrt' do
    it 'returns the square root of a number' do
      expect(calc.sqrt(9)).to eq 3
      expect(calc.sqrt(8)).to eq 2.83
    end

    context 'providing a negative number' do
      it 'raises and error' do
        expect { calc.sqrt(-1) }.to raise_error ArgumentError
      end
    end
  end

  describe 'output' do
    context 'as number' do
      it 'returns a number' do
        expect(calc.output(42)).to eq 42
      end
    end
    context 'as string' do
      it 'returns a string' do
        calc = Calculator.new(true)
        expect(calc.output(42)).to eq '42'
      end
    end
  end

  describe 'working with memory' do
    let(:item) { Object.new }

    before do
      calc.memory = item
    end

    it 'returns item in memory' do
      expect(calc.memory).to be item
    end

    it 'clears the memory' do
      calc.memory
      expect(calc.memory).to be_nil
    end
  end
end