// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Turbo Rails - Hỗ trợ tăng tốc điều hướng SPA
import "@hotwired/turbo-rails";

// Import các controller được tự động tạo bởi Rails
import "controllers";

// Rails UJS - Hỗ trợ các tính năng Ajax và yêu cầu từ xa
import Rails from "@rails/ujs";
Rails.start();
