################################################################################
#
# Copyright (C) 2011 Evan J Brunner (ejbrun@appittome.com)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
################################################################################
class PDF::Reader

  class SecurityHandler

     attr_reader :encVersion, :encRevision, :keyLength, :ownerKey, 
                 :userKey, :permissions, :fileID, :pass, :key

    def initialize( eDH, idH, pass="" )
      @encVersion = eDH[:V].to_i
      @encRevision = eDH[:R].to_i
      @keyLength = eDH[:Length].to_i/8
      @ownerKey = eDH[:O]
      @userKey = eDH[:U]
      @permissions = eDH[:P].to_i
      @fileID = idH[0]
      @encryptMeta = eDH.has_key?(:EncryptMetadata)? eDH[:EncryptMetadata].to_s == "true" : false;
      @pass = pass;
      build_key
    end
  end
end

