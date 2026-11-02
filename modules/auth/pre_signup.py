def lambda_handler(event, context):
    # Automatycznie potwierdza uzytkownika w Cognito bez wysylania e-maila (obejscie blokady Learner Lab)
    event['response']['autoConfirmUser'] = True
    event['response']['autoVerifyEmail'] = True
    return event