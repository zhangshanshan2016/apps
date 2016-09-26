db.forms = new Meteor.Collection('forms')

if Meteor.isServer
    db.forms.before.insert (userId, doc) ->
        doc.created_by = userId;
        doc.created = new Date();
        if doc.current
            doc.current.created_by = userId;
            doc.current.created = new Date();
            doc.current.modified_by = userId;
            doc.current.modified = new Date();

