require 'spec_helper'

describe Sekken::Operation do
  context 'with an rpc/encoded document' do
    let(:client){ Sekken.new fixture('wsdl/rpc_encoded') }

    it 'qualifies the RPC wrapper with the soap:body namespace' do
      op = client.operation('getExchangeRateService', 'getExchangeRatePort', 'GetExchangeRate')
      expect(op.input_style).to eq('rpc/encoded')

      expect(op.body_parts).to eq([
        [['datePart'],         {namespace: nil, form: 'unqualified', singular: true, type: 'xsd:date'}],
        [['fromCurrencyPart'], {namespace: nil, form: 'unqualified', singular: true, type: 'xsd:string'}],
        [['toCurrencyPart'],   {namespace: nil, form: 'unqualified', singular: true, type: 'xsd:string'}]
      ])
    end
  end
end
