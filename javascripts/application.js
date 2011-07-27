// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
<script>
function serialize_fields(){
  var fields = new Array();
  fields.push(Form.Element.serialize('form.body'));
  return fields.join('&');
}
</script>
