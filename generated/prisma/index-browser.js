
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal,
  objectEnumValues,
  makeStrictEnum,
  Public,
  getRuntime,
  skip
} = require('./runtime/index-browser.js')


const Prisma = {}

exports.Prisma = Prisma
exports.$Enums = {}

/**
 * Prisma Client JS version: 6.6.0
 * Query Engine version: f676762280b54cd07c770017ed3711ddde35f37a
 */
Prisma.prismaVersion = {
  client: "6.6.0",
  engine: "f676762280b54cd07c770017ed3711ddde35f37a"
}

Prisma.PrismaClientKnownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientKnownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientUnknownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientRustPanicError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientRustPanicError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientInitializationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientInitializationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientValidationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientValidationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`sqltag is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.empty = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`empty is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.join = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`join is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.raw = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`raw is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.validator = Public.validator

/**
* Extensions
*/
Prisma.getExtensionContext = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.getExtensionContext is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.defineExtension = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.defineExtension is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}

/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = objectEnumValues.instances.DbNull
Prisma.JsonNull = objectEnumValues.instances.JsonNull
Prisma.AnyNull = objectEnumValues.instances.AnyNull

Prisma.NullTypes = {
  DbNull: objectEnumValues.classes.DbNull,
  JsonNull: objectEnumValues.classes.JsonNull,
  AnyNull: objectEnumValues.classes.AnyNull
}



/**
 * Enums
 */

exports.Prisma.TransactionIsolationLevel = makeStrictEnum({
  ReadUncommitted: 'ReadUncommitted',
  ReadCommitted: 'ReadCommitted',
  RepeatableRead: 'RepeatableRead',
  Serializable: 'Serializable'
});

exports.Prisma.ProvinceScalarFieldEnum = {
  id: 'id',
  name: 'name',
  longitude: 'longitude',
  latitude: 'latitude',
  geoId: 'geoId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.CityScalarFieldEnum = {
  id: 'id',
  name: 'name',
  longitude: 'longitude',
  latitude: 'latitude',
  geoId: 'geoId',
  provinceId: 'provinceId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.SchoolScalarFieldEnum = {
  id: 'id',
  identity: 'identity',
  name: 'name',
  longitude: 'longitude',
  latitude: 'latitude',
  cityId: 'cityId',
  provinceId: 'provinceId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.UserScalarFieldEnum = {
  id: 'id',
  authId: 'authId',
  email: 'email',
  role: 'role',
  suspend: 'suspend',
  accountType: 'accountType',
  firstTest: 'firstTest',
  fullname: 'fullname',
  birthDate: 'birthDate',
  grade: 'grade',
  lastGradeUpdateAt: 'lastGradeUpdateAt',
  schoolIdentity: 'schoolIdentity',
  loginAt: 'loginAt',
  logoutAt: 'logoutAt',
  playTime: 'playTime',
  characterUsed: 'characterUsed',
  inventory: 'inventory',
  schoolId: 'schoolId',
  cityId: 'cityId',
  provinceId: 'provinceId',
  adminId: 'adminId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  username: 'username',
  lastIdZoneUnlocked: 'lastIdZoneUnlocked',
  lastIdZonePosition: 'lastIdZonePosition'
};

exports.Prisma.ZoneScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  userId: 'userId',
  isComplete: 'isComplete',
  completedAt: 'completedAt',
  lastLevelId: 'lastLevelId',
  lastSubLevelId: 'lastSubLevelId',
  lastInnerLevelId: 'lastInnerLevelId',
  lastLevelUnlock: 'lastLevelUnlock',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  pretest: 'pretest',
  pretestTryCount: 'pretestTryCount',
  posttest: 'posttest',
  posttestTryCount: 'posttestTryCount'
};

exports.Prisma.LevelScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  isUnlock: 'isUnlock',
  unlockedAt: 'unlockedAt',
  isComplete: 'isComplete',
  completedAt: 'completedAt',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.SubLevelScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  levelInGameId: 'levelInGameId',
  isUnlock: 'isUnlock',
  unlockedAt: 'unlockedAt',
  isComplete: 'isComplete',
  completedAt: 'completedAt',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.InnerLevelScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  levelInGameId: 'levelInGameId',
  subLevelInGameId: 'subLevelInGameId',
  isUnlock: 'isUnlock',
  unlockedAt: 'unlockedAt',
  isComplete: 'isComplete',
  completedAt: 'completedAt',
  correctAttempt: 'correctAttempt',
  playTime: 'playTime',
  point: 'point',
  played: 'played',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.GempoScalarFieldEnum = {
  id: 'id',
  isUnlock: 'isUnlock',
  unlockedAt: 'unlockedAt',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.ChampionshipScalarFieldEnum = {
  id: 'id',
  isUnlock: 'isUnlock',
  unlockedAt: 'unlockedAt',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.GempoRecordScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  gempoInGameId: 'gempoInGameId',
  played: 'played',
  point: 'point',
  lastPlayedAt: 'lastPlayedAt',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.ChampionshipRecordScalarFieldEnum = {
  id: 'id',
  inGameId: 'inGameId',
  zoneInGameId: 'zoneInGameId',
  championshipInGameId: 'championshipInGameId',
  teamWin: 'teamWin',
  teamLose: 'teamLose',
  teamPlayed: 'teamPlayed',
  teamPoint: 'teamPoint',
  teamLastPlayedAt: 'teamLastPlayedAt',
  soloWin: 'soloWin',
  soloLose: 'soloLose',
  soloPlayed: 'soloPlayed',
  soloPoint: 'soloPoint',
  soloLastPlayedAt: 'soloLastPlayedAt',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  userId: 'userId'
};

exports.Prisma.UserLoginScalarFieldEnum = {
  id: 'id',
  userId: 'userId',
  loginDate: 'loginDate',
  logoutDate: 'logoutDate'
};

exports.Prisma.AdminScalarFieldEnum = {
  id: 'id',
  authId: 'authId',
  email: 'email',
  name: 'name',
  suspend: 'suspend',
  role: 'role',
  provinceId: 'provinceId',
  cityId: 'cityId',
  schoolId: 'schoolId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.AdminOperationHistoryScalarFieldEnum = {
  id: 'id',
  createdAt: 'createdAt',
  adminId: 'adminId',
  opAdminId: 'opAdminId',
  operation: 'operation'
};

exports.Prisma.AdminAuthorityScalarFieldEnum = {
  id: 'id',
  adminId: 'adminId',
  provinceId: 'provinceId',
  grades: 'grades'
};

exports.Prisma.BannerScalarFieldEnum = {
  id: 'id',
  thumbnailId: 'thumbnailId',
  thumbnail: 'thumbnail',
  link: 'link',
  startedAt: 'startedAt',
  endedAt: 'endedAt',
  isHide: 'isHide',
  adminId: 'adminId'
};

exports.Prisma.BannerLocationScalarFieldEnum = {
  id: 'id',
  bannerId: 'bannerId',
  provinceId: 'provinceId'
};

exports.Prisma.BannerVisitorScalarFieldEnum = {
  id: 'id',
  bannerId: 'bannerId',
  userId: 'userId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  traffic: 'traffic'
};

exports.Prisma.TestScalarFieldEnum = {
  id: 'id',
  name: 'name',
  category: 'category',
  question: 'question',
  duration: 'duration',
  passedPoint: 'passedPoint',
  remidialCount: 'remidialCount',
  type: 'type',
  quota: 'quota',
  currentQuota: 'currentQuota',
  code: 'code',
  zoneId: 'zoneId',
  startedAt: 'startedAt',
  endedAt: 'endedAt',
  description: 'description',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  adminId: 'adminId'
};

exports.Prisma.TestParticipantScalarFieldEnum = {
  id: 'id',
  testId: 'testId',
  userId: 'userId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  highscore: 'highscore'
};

exports.Prisma.TestParticipantRecordScalarFieldEnum = {
  id: 'id',
  participantId: 'participantId',
  startedAt: 'startedAt',
  endedAt: 'endedAt',
  score: 'score',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  answers: 'answers'
};

exports.Prisma.BackgroundScalarFieldEnum = {
  id: 'id',
  name: 'name',
  thumbnailId: 'thumbnailId',
  thumbnail: 'thumbnail',
  isUse: 'isUse',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.SettingScalarFieldEnum = {
  id: 'id',
  name: 'name',
  title: 'title',
  content: 'content',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.AdminTransactionScalarFieldEnum = {
  id: 'id',
  name: 'name',
  status: 'status',
  archived: 'archived',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  adminId: 'adminId',
  quantity: 'quantity',
  subscriptionTime: 'subscriptionTime',
  zones: 'zones',
  transactionRef: 'transactionRef',
  amount: 'amount',
  description: 'description',
  transactionImageId: 'transactionImageId',
  transactionImageUrl: 'transactionImageUrl',
  processedById: 'processedById',
  processedAt: 'processedAt'
};

exports.Prisma.RedeemCodeScalarFieldEnum = {
  id: 'id',
  suspend: 'suspend',
  transactionId: 'transactionId',
  adminId: 'adminId',
  code: 'code',
  expiredAt: 'expiredAt',
  currentAmount: 'currentAmount',
  maxAmount: 'maxAmount',
  data: 'data',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.CodeRedemeerScalarFieldEnum = {
  id: 'id',
  banned: 'banned',
  userId: 'userId',
  codeId: 'codeId',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt'
};

exports.Prisma.MultiplayerRoomScalarFieldEnum = {
  id: 'id',
  max: 'max',
  gameplayId: 'gameplayId',
  botOwner: 'botOwner',
  startedAt: 'startedAt',
  endedAt: 'endedAt',
  expiredAt: 'expiredAt',
  isStarted: 'isStarted',
  isEnded: 'isEnded',
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  currentMember: 'currentMember'
};

exports.Prisma.MultiPlayerMemberScalarFieldEnum = {
  id: 'id',
  roomId: 'roomId',
  userId: 'userId',
  point: 'point',
  bonusPoint: 'bonusPoint',
  isReady: 'isReady',
  isComplete: 'isComplete',
  isBot: 'isBot',
  joinedAt: 'joinedAt',
  finishedAt: 'finishedAt',
  isDisconnect: 'isDisconnect'
};

exports.Prisma.SortOrder = {
  asc: 'asc',
  desc: 'desc'
};

exports.Prisma.JsonNullValueInput = {
  JsonNull: Prisma.JsonNull
};

exports.Prisma.QueryMode = {
  default: 'default',
  insensitive: 'insensitive'
};

exports.Prisma.NullsOrder = {
  first: 'first',
  last: 'last'
};

exports.Prisma.JsonNullValueFilter = {
  DbNull: Prisma.DbNull,
  JsonNull: Prisma.JsonNull,
  AnyNull: Prisma.AnyNull
};
exports.Role = exports.$Enums.Role = {
  Developer: 'Developer',
  SuperAdmin: 'SuperAdmin',
  Admin: 'Admin',
  SchoolAdmin: 'SchoolAdmin',
  Teacher: 'Teacher',
  User: 'User'
};

exports.AccountType = exports.$Enums.AccountType = {
  LMS: 'LMS',
  Self: 'Self'
};

exports.Operation = exports.$Enums.Operation = {
  None: 'None',
  Create: 'Create',
  Update: 'Update',
  Delete: 'Delete'
};

exports.QuestionType = exports.$Enums.QuestionType = {
  Addition: 'Addition',
  Multiplication: 'Multiplication',
  Subtraction: 'Subtraction',
  Division: 'Division',
  Bakalkubagi: 'Bakalkubagi'
};

exports.TestType = exports.$Enums.TestType = {
  PreTest: 'PreTest',
  PostTest: 'PostTest',
  FirstPreTest: 'FirstPreTest',
  Contest: 'Contest'
};

exports.Transaction = exports.$Enums.Transaction = {
  Pending: 'Pending',
  Cancelled: 'Cancelled',
  Settlement: 'Settlement'
};

exports.Prisma.ModelName = {
  Province: 'Province',
  City: 'City',
  School: 'School',
  User: 'User',
  Zone: 'Zone',
  Level: 'Level',
  SubLevel: 'SubLevel',
  InnerLevel: 'InnerLevel',
  Gempo: 'Gempo',
  Championship: 'Championship',
  GempoRecord: 'GempoRecord',
  ChampionshipRecord: 'ChampionshipRecord',
  UserLogin: 'UserLogin',
  Admin: 'Admin',
  AdminOperationHistory: 'AdminOperationHistory',
  AdminAuthority: 'AdminAuthority',
  Banner: 'Banner',
  BannerLocation: 'BannerLocation',
  BannerVisitor: 'BannerVisitor',
  Test: 'Test',
  TestParticipant: 'TestParticipant',
  TestParticipantRecord: 'TestParticipantRecord',
  Background: 'Background',
  Setting: 'Setting',
  AdminTransaction: 'AdminTransaction',
  RedeemCode: 'RedeemCode',
  CodeRedemeer: 'CodeRedemeer',
  MultiplayerRoom: 'MultiplayerRoom',
  MultiPlayerMember: 'MultiPlayerMember'
};

/**
 * This is a stub Prisma Client that will error at runtime if called.
 */
class PrismaClient {
  constructor() {
    return new Proxy(this, {
      get(target, prop) {
        let message
        const runtime = getRuntime()
        if (runtime.isEdge) {
          message = `PrismaClient is not configured to run in ${runtime.prettyName}. In order to run Prisma Client on edge runtime, either:
- Use Prisma Accelerate: https://pris.ly/d/accelerate
- Use Driver Adapters: https://pris.ly/d/driver-adapters
`;
        } else {
          message = 'PrismaClient is unable to run in this browser environment, or has been bundled for the browser (running in `' + runtime.prettyName + '`).'
        }

        message += `
If this is unexpected, please open an issue: https://pris.ly/prisma-prisma-bug-report`

        throw new Error(message)
      }
    })
  }
}

exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
