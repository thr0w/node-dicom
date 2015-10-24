#! /usr/bin/env /coffee

pdu = require "../lib/pdu"

ECHO_RAW =[ 1, 0, 0, 0, 0, 197, 0, 1, 0, 0, 84, 69, 83,
            84, 77, 69, 32, 32, 32, 32, 32, 32, 32, 32, 32,
            32, 68, 67, 77, 69, 67, 72, 79, 32, 32, 32, 32,
            32, 32, 32, 32, 32, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 21, 49, 46,
            50, 46, 56, 52, 48, 46, 49, 48, 48, 48, 56, 46,
            51, 46, 49, 46, 49, 46, 49, 32, 0, 0, 46, 1,
            0, 0, 0, 48, 0, 0, 17, 49, 46, 50, 46, 56, 52,
            48, 46, 49, 48, 48, 48, 56, 46, 49, 46, 49,
            64, 0, 0, 17, 49, 46, 50, 46, 56, 52, 48, 46,
            49, 48, 48, 48, 56, 46, 49, 46, 50, 80, 0,
            0, 50, 81, 0, 0, 4, 0, 0, 64, 0, 82, 0, 0, 15,
            49, 46, 50, 46, 52, 48, 46, 48, 46, 49,
            51, 46, 49, 46, 49, 83, 0, 0, 4, 0, 0, 0, 0, 85,
            0, 0, 11, 100, 99, 109, 52, 99, 104, 101,
            45, 50, 46, 48 ]

fujinon_raw = [ 1,  0,  0,  0, 0, 226, 0, 1, 0, 0, 71, 79, 73, 
           65, 66, 65, 32, 32, 32, 32, 32, 32, 32, 32, 32, 
           32, 77, 79, 82, 65, 78, 71, 79, 32, 32, 32, 32, 
           32, 32, 32, 32, 32, 0, 0, 0, 0, 0, 0, 0, 0, 
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
           0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 21, 49, 46, 
           50, 46, 56, 52, 48, 46, 49, 48, 48, 48, 56, 46, 
           51, 46, 49, 46, 49, 46, 49, 32, 0, 0, 46, 1, 
           0, 255, 0, 48, 0, 0, 17, 49, 46, 50, 46, 56, 
           52, 48, 46, 49, 48, 48, 48, 56, 46, 49, 46, 49, 
           64, 0, 0, 17, 49, 46, 50, 46, 56, 52, 48, 46, 
           49, 48, 48, 48, 56, 46, 49, 46, 50, 80, 0, 0, 
           79, 81, 0, 0, 4, 0, 0, 64, 0, 82, 0, 0, 49, 49, 
           46, 50, 46, 51, 57, 50, 46, 50, 48, 48, 48, 51, 
           54, 46, 57, 49, 50, 53, 46, 49, 57, 50, 48, 52, 
           53, 50, 53, 53, 50, 53, 53, 48, 49, 56, 46, 54, 
           52, 53, 57, 52, 54, 50, 48, 56, 54, 54, 46, 49, 
           85, 0, 0, 14, 70, 109, 115, 69, 115, 65, 48, 49, 
           95, 50, 46, 52, 48, 48 ]

            

web_raw = [
    0x02,0x00,0x00,0x00,0x00,0xb8,0x00,0x01,0x00,0x00,0x5a,0x53,0x43,0x41,
    0x4e,0x2d,0x53,0x54,0x4f,0x52,0x41,0x47,0x45,0x20,0x20,0x20,0x46,0x55,0x4a,0x49,
    0x4e,0x4f,0x4e,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,0x15,
    0x31,0x2e,0x32,0x2e,0x38,0x34,0x30,0x2e,0x31,0x30,0x30,0x30,0x38,0x2e,0x33,0x2e,
    0x31,0x2e,0x31,0x2e,0x31,0x21,0x00,0x00,0x19,0x01,0x00,0x00,0x00,0x40,0x00,0x00,
    0x11,0x31,0x2e,0x32,0x2e,0x38,0x34,0x30,0x2e,0x31,0x30,0x30,0x30,0x38,0x2e,0x31,
    0x2e,0x32,0x50,0x00,0x00,0x3a,0x51,0x00,0x00,0x04,0x00,0x00,0x40,0x00,0x52,0x00,
    0x00,0x1b,0x31,0x2e,0x32,0x2e,0x32,0x37,0x36,0x2e,0x30,0x2e,0x37,0x32,0x33,0x30,
    0x30,0x31,0x30,0x2e,0x33,0x2e,0x30,0x2e,0x33,0x2e,0x36,0x2e,0x30,0x55,0x00,0x00,
    0x0f,0x4f,0x46,0x46,0x49,0x53,0x5f,0x44,0x43,0x4d,0x54,0x4b,0x5f,0x33,0x36,0x30   
  ]

fujinon_PDU = {
  "name": "association_rq",
  "called_aet_title": "ZSCAN",
  "calling_aet_title": "FUGINON",
  "application_context": "1.2.840.10008.3.1.1.1"
  "presentation_context": [
    "id": 1,
    "abstract_syntax": "1.2.840.10008.1.1",
    "transfer_syntax": ["1.2.840.10008.1.2"]]
  "user_information":
    "maximum_length": 16384
    "implementation_class_uid": "1.2.40.0.13.1.1"
    "asynchronous_operations_window": undefined
    "implementation_version_name": "FmsEsA01_2.400",
    "implementation_class_uid": '1.2.392.200036.9125.192045255255018.64594620866.1'
}

fujinon_resp_PDU = {
  "name": "association_ac",
  "called_aet_title": "FUGINON",
  "calling_aet_title": "ZSCAN",
  "application_context": "1.2.840.10008.3.1.1.1"
  "presentation_context": [
    "id": 1,
    "abstract_syntax": "1.2.840.10008.1.1",
    "transfer_syntax": ["1.2.840.10008.1.2"]]
  "user_information":
    "maximum_length": 16384
    "implementation_class_uid": "1.2.40.0.13.1.1"
    "asynchronous_operations_window": undefined
    "implementation_version_name": "FmsEsA01_2.400",
    "implementation_class_uid": '1.2.392.200036.9125.192045255255018.64594620866.1'
    "asynchronous_operations_window":
        "maximum_number_operations_invoked": 0
        "maximum_number_operations_performed": 0
}

ECHO_PDU = {
  "name": "association_rq",
  "called_aet_title": "TESTME",
  "calling_aet_title": "DCMECHO",
  "application_context": "1.2.840.10008.3.1.1.1"
  "presentation_context": [
    "id": 1,
    "abstract_syntax": "1.2.840.10008.1.1",
    "transfer_syntax": ["1.2.840.10008.1.2"]]
  "user_information":
    "maximum_length": 16384
    "implementation_class_uid": "1.2.40.0.13.1.1"
    "asynchronous_operations_window":
        "maximum_number_operations_invoked": 0
        "maximum_number_operations_performed": 0
    "implementation_version_name": "dcm4che-2.0"
}

exports.PDUTest =
  "test decoding echo association request": (test) ->
    test.expect 1

    _decoder = new pdu.PDUDecoder()
    _decoder.on 'data', (pdu) ->
      test.deepEqual ECHO_PDU, pdu.to_json()
      test.done()
    _decoder.write(new Buffer(ECHO_RAW))

  "test encoding echo association request": (test) ->
    test.expect 1

    _encoder = new pdu.PDUEncoder()
    _encoder.on 'data', (buff) ->
      _decoder = new pdu.PDUDecoder()
      _decoder.on 'data', (pdu) ->
        test.deepEqual ECHO_PDU, pdu.to_json()
        test.done()
      _decoder.write buff
    _encoder.write new pdu.PDUAssociateRq(ECHO_PDU)

  "web-test decoding echo association request": (test) ->
    test.expect 1

    _decoder = new pdu.PDUDecoder()
    _decoder.on 'data', (pdu) ->
      test.deepEqual ECHO_PDU, pdu.to_json()
      test.done()
    _decoder.write(new Buffer(web_raw))

###
  "FUJINON - test decoding echo association request": (test) ->
    test.expect 1

    _decoder = new pdu.PDUDecoder()
    _decoder.on 'data', (pdu) ->      
      test.deepEqual fujinon_PDU, pdu.to_json()
      test.done()
    _decoder.write(new Buffer(fujinon_raw))

  "FUJINON - test encoding echo association accept": (test) ->
    test.expect 1

    _encoder = new pdu.PDUEncoder()
    _encoder.on 'data', (buff) ->
      _decoder = new pdu.PDUDecoder()
      _decoder.on 'data', (pdu) ->
        test.deepEqual fujinon_resp_PDU, pdu.to_json()
        test.done()
      _decoder.write buff
    _encoder.write new pdu.PDUAssociateAc(fujinon_resp_PDU)    
###