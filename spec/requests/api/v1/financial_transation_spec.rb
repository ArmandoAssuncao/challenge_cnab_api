require 'rails_helper'

RSpec.describe 'FinancialTransaction API' do
  let(:api_key) { ApiKey.create! email: 'test@email.com', description: 'description test' }
  let(:auth_headers) { { 'X-Api-Key' => api_key.access_token } }

  # Test suite for GET
  describe 'GET /api/v1/financial_transactions' do
    context 'when posts exists' do
      it 'return status code 200' do
        get '/api/v1/financial_transactions', headers: auth_headers
        expect(response).to have_http_status(200)
      end
    end

    context 'when header X-Api-Key not present' do
      it 'return status code 200' do
        get '/api/v1/financial_transactions'
        expect(response).to have_http_status(422)
      end
    end

    context 'when query type_id is present' do
      url = '/api/v1/financial_transactions?type_id='

      it 'returns status code 200 when type_id=1' do
        get url + '1', headers: auth_headers
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200 when type_id=abc' do
        get url + 'abc', headers: auth_headers
        expect(response).to have_http_status(400)
      end
    end

    context 'when query datetime is present' do
      url = '/api/v1/financial_transactions?datetime='

      it 'returns status code 200 when datetime=2018-03-21' do
        get url + '2018-03-21', headers: auth_headers
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200 when datetime=1234' do
        get url + '1234', headers: auth_headers
        expect(response).to have_http_status(400)
      end
    end

    context 'when query value is present' do
      url = '/api/v1/financial_transactions?value='

      it 'returns status code 200 when value=123.45' do
        get url + '123.45', headers: auth_headers
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200 when value=abc' do
        get url + 'abc', headers: auth_headers
        expect(response).to have_http_status(400)
      end
    end

    context 'when query cpf is present' do
      url = '/api/v1/financial_transactions?cpf='

      it 'returns status code 200 when cpf=12345678901' do
        get url + '12345678901', headers: auth_headers
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200 when cpf=12345' do
        get url + '12345', headers: auth_headers
        expect(response).to have_http_status(400)
      end
    end

    context 'when query card_number is present' do
      url = '/api/v1/financial_transactions?card_number='

      it 'returns status code 200 when card_number=123456789' do
        get url + '123456789', headers: auth_headers
        expect(response).to have_http_status(200)
      end

      it 'returns status code 200 when card_number=12' do
        get url + '12', headers: auth_headers
        expect(response).to have_http_status(400)
      end
    end
  end
end
