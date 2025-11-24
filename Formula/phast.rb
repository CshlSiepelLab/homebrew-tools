class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time models"
  homepage "https://github.com/CshlSiepelLab/phast"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/1.7.0.tar.gz"
  sha256 "af45c1b0922f578ed0b3698eb765a45cd4030072f838558155beb9545b613b47"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "openblas" # for Linux; on macOS veclib/Accelerate is fine

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
