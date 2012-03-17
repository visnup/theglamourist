ActionDispatch::ExceptionWrapper.rescue_responses.update(
  'SecurityError' => :unauthorized
)
