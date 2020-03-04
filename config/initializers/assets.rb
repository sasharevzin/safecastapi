# frozen_string_literal: true

Rails.application.config.assets.precompile += %w(
  bgeigie_viewer.js
  bgeigie_viewer_worker.js
  device_story/devices/index.js
  html5shiv.js
)
