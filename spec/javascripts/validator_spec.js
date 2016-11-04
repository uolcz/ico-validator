describe("ICO validator", function() {
  var icoList, i;
  icoList = ['61499609', '25275500', '29233011'];
  for( i in icoList ) if( icoList.hasOwnProperty(i) ) {
    var icoValid = icoList[i];
    it("ICO " + icoValid + " is valid", function() {
      expect(icoValidator.validIco(icoValid)).toBeTruthy();
    });
  }
  icoList = [null, '', '1', 123, '1111111X', '00000000', '614996097', '123456789'];
  for( i in icoList ) if( icoList.hasOwnProperty(i) ) {
    ico_invalid = icoList[i];
    it("ICO is invalid with value " + ico_invalid, function() {
      expect(icoValidator.validIco(ico_invalid)).toBeFalsy();
    });
  }
});
