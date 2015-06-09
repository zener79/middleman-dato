require 'spec_helper'

RSpec.describe Dato::Record do
  subject(:record) { described_class.new(attributes, content_type) }
  let(:attributes) { {} }
  let(:content_type) { { fields: {} } }

  it 'gets attributes and content type as constructor parameters' do
    record
  end

  describe '#singleton?' do
    context 'if the record is a singleton' do
      let(:content_type) { { fields: {}, singleton: true } }

      it 'returns true' do
        expect(record.singleton?).to eq(true)
      end
    end

    context 'else' do
      let(:content_type) { { fields: {}, singleton: false } }

      it 'returns false' do
        expect(record.singleton?).to eq(false)
      end
    end
  end

  describe '#respond_to?' do
    let(:attributes) { { foo: 'bar' } }

    context 'if the record contains the requested field' do
      it 'returns true' do
        expect(record.respond_to?(:foo)).to eq(true)
      end
    end

    context 'else' do
      it 'returns true' do
        expect(record.respond_to?(:bar)).to eq(false)
      end
    end
  end

  describe '#id' do
    let(:attributes) { { id: 123 } }

    it 'returns the id of the record' do
      expect(record.id).to eq(123)
    end
  end

  describe '#updated_at' do
    let(:attributes) { { updated_at: '2015-06-09T12:47' } }

    it 'parses the field and returns a Time object' do
      expect(record.updated_at).to eq(Time.new(2015, 6, 9, 12, 47))
    end
  end

  describe '#method_missing' do
    let(:content_type) { { fields: { foo: { field_type: 'text' } } } }
    let(:attributes) { { foo: 'bar' } }

    before do
      allow(Dato::Field).to receive(:value)
    end

    context 'if the requested method matches one attribute' do
      before { record.foo }

      it 'calls the ".value" method of "Field" class' do
        expect(Dato::Field).to have_received(:value).with(attributes[:foo], content_type[:fields][:foo])
      end
    end
  end
end
