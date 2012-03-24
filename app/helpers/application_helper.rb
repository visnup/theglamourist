module ApplicationHelper
  def asset_data_uri(path)
    asset  = asset_paths.asset_for path, nil
    base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
    "data:#{asset.content_type};base64,#{Rack::Utils.escape(base64)}"
  end
end
