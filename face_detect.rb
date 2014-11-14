require 'opencv'

OPEN_CV_LIB  = '/usr/local/share/OpenCV/haarcascades'
DEFAULT_PATH = "#{OPEN_CV_LIB}/haarcascade_frontalface_default.xml"

# face detect
class FaceDetect
  class << self
    def run
      window = OpenCV::GUI::Window.new 'face detect'
      capture = OpenCV::CvCapture.open
      detector = OpenCV::CvHaarClassifierCascade.load DEFAULT_PATH

      loop do
        image = capture.query
        image = image.resize OpenCV::CvSize.new 640, 360
        detector.detect_objects(image).each do |rect|
          puts "detect!! : #{rect.top_left},
                           #{rect.top_right},
                           #{rect.bottom_left},
                           #{rect.bottom_right}"
          image.rectangle! rect.top_left,
                           rect.bottom_right,
                           color: OpenCV::CvColor::Red
        end
        window.show image
        break if OpenCV::GUI.wait_key(100)
      end
    end
  end
end
