class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time models"
  homepage "https://github.com/CshlSiepelLab/phast"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/v1.9.9.tar.gz"
  sha256 "ef9fd7c6e6c02e866162cf41ff372559f105ae3f9c4dc8562103533e41f1b069"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "openblas" # for Linux; on macOS veclib/Accelerate is fine
  depends_on "pcre"
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "cmake", "--build", ".", "--parallel"
      system "cmake", "--install", "."
    end
  end

  test do
    # simple sanity check
    system "#{bin}/phyloFit", "-h"
  end
end
