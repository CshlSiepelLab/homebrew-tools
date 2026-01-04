class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time models"
  homepage "https://github.com/CshlSiepelLab/phast"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "98e222d72fcbb0fe51e849eb5d761cb68dbf6d3395f4a0c00a730f670a9fc625"
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
