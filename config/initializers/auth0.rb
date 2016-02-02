Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'ZxAjdLANy7fZ2tTRWgXfZ3kjSyuNlrJ4',
    'oemhIM_Yawtfy9HisDmw1Xa6Xqj0fKAzo6WNoeAGO_yTgRO4DVtx0eTop3kR3yMz',
    'tyc0.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
