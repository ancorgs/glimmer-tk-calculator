require 'spec_helper'

describe Glimmer::Calculator::Presenter do
  context 'addition' do
    after do
      subject.press('AC')
    end
    
    it 'adds numbers' do
      expect(subject.result).to eq('0')

      # ensure it works even if no number is entered first
      subject.press('+')
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('0')

      subject.press('1')
      expect(subject.result).to eq('1')
      subject.press('+')
      expect(subject.result).to eq('1')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('+')
      expect(subject.result).to eq('3')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('0')
      expect(subject.result).to eq('30')
      subject.press('=')
      expect(subject.result).to eq('33')
      subject.press('=')
      expect(subject.result).to eq('63')
      subject.press('+')
      expect(subject.result).to eq('63')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('.')
      expect(subject.result).to eq('2.')
      subject.press('5')
      expect(subject.result).to eq('2.5')
      subject.press('=')
      expect(subject.result).to eq('65.5')
      subject.press('+')
      expect(subject.result).to eq('65.5')
      subject.press('.')
      expect(subject.result).to eq('0.')
      subject.press('5')
      expect(subject.result).to eq('0.5')
      subject.press('=')
      expect(subject.result).to eq('66')

      # start over again
      subject.press('1')
      expect(subject.result).to eq('1')
      subject.press('+')
      expect(subject.result).to eq('1')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('=')
      expect(subject.result).to eq('3')
    end
    
    it 'subtracts numbers' do
      expect(subject.result).to eq('0')

      # ensure it works even if no number is entered first
      subject.press('-')
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('0')

      subject.press('6')
      expect(subject.result).to eq('6')
      subject.press('5')
      expect(subject.result).to eq('65')
      subject.press('-')
      expect(subject.result).to eq('65')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('-')
      expect(subject.result).to eq('63')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('0')
      expect(subject.result).to eq('30')
      subject.press('=')
      expect(subject.result).to eq('33')
      subject.press('=')
      expect(subject.result).to eq('3')
      subject.press('-')
      expect(subject.result).to eq('3')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('.')
      expect(subject.result).to eq('2.')
      subject.press('5')
      expect(subject.result).to eq('2.5')
      subject.press('=')
      expect(subject.result).to eq('0.5')
      subject.press('-')
      expect(subject.result).to eq('0.5')
      subject.press('.')
      expect(subject.result).to eq('0.')
      subject.press('2')
      expect(subject.result).to eq('0.2')
      subject.press('=')
      expect(subject.result).to eq('0.3')

      # start over again
      subject.press('6')
      expect(subject.result).to eq('6')
      subject.press('5')
      expect(subject.result).to eq('65')
      subject.press('-')
      expect(subject.result).to eq('65')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('-')
      expect(subject.result).to eq('63')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('0')
      expect(subject.result).to eq('30')
      subject.press('=')
      expect(subject.result).to eq('33')
    end
    
    it 'multiplies numbers' do
      expect(subject.result).to eq('0')

      # ensure it works even if no number is entered first
      subject.press('*')
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('0')

      subject.press('1')
      expect(subject.result).to eq('1')
      subject.press('0')
      expect(subject.result).to eq('10')
      subject.press('*')
      expect(subject.result).to eq('10')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('*')
      expect(subject.result).to eq('20')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('60')
      subject.press('=')
      expect(subject.result).to eq('180')
      subject.press('*')
      expect(subject.result).to eq('180')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('=')
      expect(subject.result).to eq('360')
      subject.press('*')
      expect(subject.result).to eq('360')
      subject.press('.')
      expect(subject.result).to eq('0.')
      subject.press('5')
      expect(subject.result).to eq('0.5')
      subject.press('=')
      expect(subject.result).to eq('180')

      # start over again
      subject.press('1')
      expect(subject.result).to eq('1')
      subject.press('0')
      expect(subject.result).to eq('10')
      subject.press('*')
      expect(subject.result).to eq('10')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('*')
      expect(subject.result).to eq('20')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('60')
      
      # fractions
      subject.press('0')
      expect(subject.result).to eq('0')
      subject.press('.')
      expect(subject.result).to eq('0.')
      subject.press('3')
      expect(subject.result).to eq('0.3')
      subject.press('*')
      expect(subject.result).to eq('0.3')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('0.9')
    end
    
    it 'divides numbers' do
      expect(subject.result).to eq('0')

      # ensure it works even if no number is entered first
      subject.press('/')
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('Not a number')

      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('6')
      expect(subject.result).to eq('36')
      subject.press('0')
      expect(subject.result).to eq('360')
      subject.press('/')
      expect(subject.result).to eq('360')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('/')
      expect(subject.result).to eq('180')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('60')
      subject.press('=')
      expect(subject.result).to eq('20')
      subject.press('/')
      expect(subject.result).to eq('20')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('=')
      expect(subject.result).to eq('10')
      subject.press('/')
      expect(subject.result).to eq('10')
      subject.press('0')
      expect(subject.result).to eq('0')
      subject.press('.')
      expect(subject.result).to eq('0.')
      subject.press('5')
      expect(subject.result).to eq('0.5')
      subject.press('=')
      expect(subject.result).to eq('20')
      
      # start over again
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('6')
      expect(subject.result).to eq('36')
      subject.press('0')
      expect(subject.result).to eq('360')
      subject.press('/')
      expect(subject.result).to eq('360')
      subject.press('2')
      expect(subject.result).to eq('2')
      subject.press('/')
      expect(subject.result).to eq('180')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('60')
    end
    
    it 'does nothing if equals is pressed without having entered an operation' do
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('0')
      subject.press('=')
      expect(subject.result).to eq('0')
      subject.press('3')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('3')
      subject.press('=')
      expect(subject.result).to eq('3')
      subject.press('6')
      expect(subject.result).to eq('6')
      subject.press('4')
      expect(subject.result).to eq('64')
      subject.press('=')
      expect(subject.result).to eq('64')
      subject.press('=')
      expect(subject.result).to eq('64')
    end    
    
  end
end