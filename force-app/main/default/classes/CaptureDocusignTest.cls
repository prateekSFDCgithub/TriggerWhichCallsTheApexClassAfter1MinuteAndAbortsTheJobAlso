@isTest
public class CaptureDocusignTest {
    @isTest 
    static void testDebugDocInfo() {
        // Create mock data mimicking the DocuSign response
        Map<String, Object> mockResponse = new Map<String, Object>{
            'event' => 'envelope-completed',
            'data' => new Map<String, Object>{
                'envelopeSummary' => new Map<String, Object>{
                    'recipients' => new Map<String, Object>{
                        'signers' => new List<Object>{
                            new Map<String, Object>{
                                'email' => 'test@example.com',
                                'tabs' => new Map<String, Object>{
                                    'textTabs' => new List<Object>{
                                        new Map<String, Object>{
                                            'tabLabel' => 'DBA Name',
                                            'value' => 'Test DBA'
                                        },
                                        new Map<String, Object>{
                                            'tabLabel' => 'Business Name',
                                            'value' => 'Test Business'
                                        },
                                        new Map<String, Object>{
                                            'tabLabel' => 'Amount Requested',
                                            'value' => '1000'
                                        } ,
                                            new Map<String, Object>{
                                            'tabLabel' => 'Annual Revenue',
                                            'value' => '1000'
                                        } ,
                                            new Map<String, Object>{
                                            'tabLabel' => 'Federal Tax Id',
                                            'value' => 'sjsjs'
                                        } ,
                                            new Map<String, Object>{
                                            'tabLabel' => 'Phone Number',
                                            'value' => '9887778'
                                        } ,
                                            new Map<String, Object>{
                                            'tabLabel' => 'Website',
                                            'value' => 'www.tt.com'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'Business Start Date',
                                            'value' => '09/08/2019'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'Industry',
                                            'value' => 'ccddc'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'Business Address',
                                            'value' => 'cccdcd'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'Use of Proceeds',
                                            'value' => 'sdsdd'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'city',
                                            'value' => 'ffff'
                                        },
                                            new Map<String, Object>{
                                            'tabLabel' => 'state',
                                            'value' => 'fg'
                                        },
                                        new Map<String, Object>{
                                            'tabLabel' => 'zip',
                                            'value' => '090909'
                                        }
                                        
                                    }
                                }
                            }
                        }
                    },
                    'envelopeDocuments' => new List<Object>{
                        new Map<String, Object>{
                            'documentId' => '1',
                            'PDFBytes' => EncodingUtil.base64Encode(Blob.valueOf('Test PDF Content')) 
                        }
                        // ... add other documents as needed
                    }
                }
            }
        };

        // Serialize the mock data to JSON string
        String jsonBody = JSON.serialize(mockResponse);

        // Create a mock RestRequest
        RestRequest req = new RestRequest();
        req.requestBody = Blob.valueOf(jsonBody);

        // Set the mock request in the RestContext
        Test.startTest();
        RestContext.request = req; 
        captureDocusign.debugDocInfo(); 
        Test.stopTest();
    }
}