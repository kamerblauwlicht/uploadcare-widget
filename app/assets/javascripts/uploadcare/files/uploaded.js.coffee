{namespace, jQuery: $, utils} = uploadcare

namespace 'uploadcare.files', (ns) ->

  class ns.UploadedFile extends ns.BaseFile
    constructor: (settings, fileIdOrUrl) ->
      super

      cdnUrl = utils.splitCdnUrl(fileIdOrUrl)
      if cdnUrl
        @fileId = cdnUrl[1]
        if cdnUrl[2]
          @cdnUrlModifiers = cdnUrl[2]
      else
        @__rejectApi('baddata')

    __startUpload: ->
      @__completeUpload()


  class ns.ReadyFile extends ns.BaseFile
    constructor: (settings, data) ->
      super
      if not data
        @__rejectApi('deleted')
      else
        @fileId = data.uuid
        @__handleFileData(data)

    __startUpload: ->
      @__completeUpload()
