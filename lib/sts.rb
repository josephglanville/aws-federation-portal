require 'open-uri'

module STS
  class Token
    SIGNIN_URL = 'https://signin.aws.amazon.com/federation'
    CONSOLE_URL = 'https://console.aws.amazon.com/'

    def initialize(username, creds, policy)
      @username = username
      @creds = creds
      @sts = AWS::STS.new(config: AWS.config.with(creds))
      @policy = AWS::STS::Policy.new
      @policy.allow(policy)
    end

    def credentials
      @sts.new_federated_session(
        @username,
        policy: @policy,
        duration: 3600
      ).credentials
    end

    def session_json
      creds = credentials
      {
        sessionId: creds[:access_key_id],
        sessionKey: creds[:secret_access_key],
        sessionToken: creds[:session_token]
      }.to_json
    end

    def signin_token
      token_url = SIGNIN_URL + '?Action=getSigninToken' + \
        '&SessionType=json&Session=' + CGI.escape(session_json)
      JSON.parse(URI.parse(token_url).read)['SigninToken']
    end

    def signin_url
      token = '&SigninToken=' + CGI.escape(signin_token)
      dest = '&Destination=' + CGI.escape(CONSOLE_URL)
      SIGNIN_URL + '?Action=login' + token + dest
    end
  end
end
