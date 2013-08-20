describe "CMS.Models.Settings.CourseGradingPolicy", ->
  beforeEach ->
    @model = new CMS.Models.Settings.CourseGradingPolicy()

  describe "parse", ->
    it "sets a null grace period to 00:00", ->
      attrs = @model.parse(grace_period: null)
      expect(attrs.grace_period).toEqual(
        hours: 0,
        minutes: 0
      )

  describe "parseGracePeriod", ->
    it "parses a time in HH:MM format", ->
      time = @model.parseGracePeriod("07:19")
      expect(time).toEqual(
        hours: 7,
        minutes: 19
      )

    it "returns null on an incorrectly formatted string", ->
      expect(@model.parseGracePeriod("asdf")).toBe(null)
      expect(@model.parseGracePeriod("7:19")).toBe(null)
