class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/0.2.0.tar.gz"
  sha256 "5b2034bb4d6ac5a3bdfc0ead45db27bde9d5845225c7c3f63c15927b0681fe3f"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"
  depends_on "openblas" # for Linux, similar as above if needed
  depends_on "pcre" 

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_ROOT=#{Formula["phast"].opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "#{bin}/vine", "--help"
  end
end
