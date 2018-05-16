class ConfirmationEmailPage < Howitzer::Web::Page
  path '/users/activate/code/{token}/mailTrackAction/1.html'
  validate :url, %r{\/users\/activate}
end
