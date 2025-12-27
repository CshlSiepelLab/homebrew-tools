class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time models"
  homepage "https://github.com/CshlSiepelLab/phast"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/1.9.1.tar.gz"
  sha256 "f9e937fcc64c17686984b82e73083d4af0cff63332305f0a8314577c11944c5d"
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
