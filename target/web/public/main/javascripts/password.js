(function() {
  $.fn.passwordStrength = function(options) {
    var getPasswordStrength, randomPassword;
    getPasswordStrength = function(H) {
      var A, B, C, D, E, F, G, I;
      D = H.length;
      if (D > 5) {
        D = 5;
      }
      F = H.replace(/[0-9]/g, "");
      G = H.length - F.length;
      if (G > 3) {
        G = 3;
      }
      A = H.replace(/\W/g, "");
      C = H.length - A.length;
      if (C > 3) {
        C = 3;
      }
      B = H.replace(/[A-Z]/g, "");
      I = H.length - B.length;
      if (I > 3) {
        I = 3;
      }
      E = ((D * 10) - 20) + (G * 10) + (C * 15) + (I * 10);
      if (E < 0) {
        E = 0;
      }
      if (E > 100) {
        E = 100;
      }
      return E;
    };
    randomPassword = function() {
      var $max, $num, $temp, chars, i, ret, size;
      chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$_+";
      size = 15;
      i = 1;
      ret = "";
      while (i <= size) {
        $max = chars.length - 1;
        $num = Math.floor(Math.random() * $max);
        $temp = chars.substr($num, 1);
        ret += $temp;
        i++;
      }
      return ret;
    };
    return this.each(function() {
      var that, v;
      that = this;
      that.opts = {};
      that.opts = $.extend({}, $.fn.passwordStrength.defaults, options);
      that.div = $("<div id=" + that.opts.targetDiv + " class=\"is0\"></div>");
      $(this).parent().after(that.div);
      that.defaultClass = that.div.attr("class");
      that.percents = (that.opts.classes.length ? 100 / that.opts.classes.length : 100);
      v = $(this).keyup(function() {
        var p, s, t;
        if (typeof el === "undefined") {
          this.el = $(this);
        }
        s = getPasswordStrength(this.value);
        p = this.percents;
        t = Math.floor(s / p);
        if (100 <= s) {
          t = this.opts.classes.length - 1;
        }
        return this.div.removeAttr("class").addClass(this.defaultClass).addClass(this.opts.classes[t]);
      });
      if (this.opts.displayRefresh) {
        return $(this).after("<i class=\"icon-refresh pointer\"></i>").next().click(function() {
          $(this).prev().val(randomPassword()).trigger("keyup");
          return false;
        });
      }
    });
  };

  $.fn.passwordStrength.defaults = {
    classes: Array("is10", "is20", "is30", "is40", "is50", "is60", "is70", "is80", "is90", "is100"),
    targetDiv: "#passwordStrengthDiv",
    displayRefresh: false,
    cache: {}
  };

  $(document).ready(function() {
    $("input[name=\"inputPassword\"]").passwordStrength();
    return $("input[name=\"passwordGenerated\"]").passwordStrength({
      targetDiv: "#passwordStrengthDiv2",
      displayRefresh: true
    });
  });

}).call(this);

//# sourceMappingURL=password.js.map
