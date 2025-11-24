class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time models"
  homepage "https://github.com/CshlSiepelLab/phast"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/1.9.0.tar.gz"
  sha256 "fb9b88836f0cf99b8e60edc751e443d1ad2c8ed1dbaa84feb56a93f215ed8ee6"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "openblas" # for Linux; on macOS veclib/Accelerate is fine
  depends_on "pcre"
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_LAPACK_BACKEND=Generic",   # whatever you called it
             "-DBLAS_LIBRARIES=#{Formula["openblas"].opt_lib}/libopenblas.dylib",
             "-DLAPACK_LIBRARIES=#{Formula["openblas"].opt_lib}/libopenblas.dylib"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    # simple sanity check
    system "#{bin}/phyloFit", "-h"
  end
end
